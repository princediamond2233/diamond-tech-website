import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import type { Request, Response, NextFunction } from 'express';
import { q } from './db.js';
const secret=process.env.JWT_SECRET||'';
export async function hashPassword(p:string){return bcrypt.hash(p,12)}
export async function verifyPassword(p:string,h:string){return bcrypt.compare(p,h)}
export function tokenFor(u:{id:string;username:string;role:string}){return jwt.sign({sub:u.id,username:u.username,role:u.role},secret,{expiresIn:'8h'})}
export function requireAuth(req:Request,res:Response,next:NextFunction){
 try { const h=req.headers.authorization||''; if(!h.startsWith('Bearer ')) return res.status(401).json({error:'Authentication required'}); const payload=jwt.verify(h.slice(7),secret) as any; (req as any).user=payload; next(); }
 catch { return res.status(401).json({error:'Invalid or expired session'}); }
}
export async function audit(req:Request, action:string, entity:string, entityId:string|undefined, details:any={}){
 const u=(req as any).user; await q('INSERT INTO audit_logs(user_id,action,entity,entity_id,details,ip) VALUES($1,$2,$3,$4,$5,$6)',[u?.sub||null,action,entity,entityId||null,details,req.ip]);
}
