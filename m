From: Tom Dawes-Gamble <tmdg@avbrief.com>
Message-Id: <200008280016.AAA16892@lindbergh.avbrief.com>
Subject: Re: [linux-lvm] LVM & NFS
Date: Mon, 28 Aug 2000 00:16:28 +0000 (UTC)
In-Reply-To: <Pine.LNX.4.21.0008272339540.6063-100000@fogarty.jakma.org> from "Paul Jakma" at Aug 27, 2000 11:41:38 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>, linux-lvm@msede.com

On Sat, 26 Aug 2000, Cristina Bulfon wrote:

> Any idea ? Is there any special configuration/setting to export LVM
> volumes via NFS?
> 

I've had no problems exporting LVM file systems via NFS

I've used both hard mounts nad auto mounts.  I've got a mix of Kernels
too.  

RH 6.0 2.2.10-lvm on an i686  
RH 6.2 2.2.15-lvm on a 2-processor i686 
RH 6.1 2.2.12 on an i486
RH 6.2 2.2.16-lvm on a 2-processor i686    
RH 6.2 2.2.16 on a i686    

To name a few.  All of the problems I had were NFS problems mostly
coz I didn't know anything about the automount. So even they were 
not problems in the end.

Don't ask why I use RH.  They fix(sp?) the kernel so you can't get LVM
in to their distributed Kernel source.

I've been running systems in anger with LVM for a good while now. 
Thats well over 12 months.  It's not let me down yet.  :-)
I was even pleasantly suprised that it even hacked my old 0xfe partition
in the latest lvm 0.8 version that uses 0x8e partitions.

Get work.  Thanks for LVM.  

Tom.
-- 
char  *r,*e,*w="%.9s%.7s%.7s\n";extern int printf(const char*,...);int main(){
int l=*w,a,b,th=*(w-~(l/=l))-*(w+l);b=*w+~th--;a=b-th;//Aviation Briefing Ltd.
r=e="  DISPLAY'tmdg@avbr';,,;'ief.com'*>"+b;l+=~b,th-=printf(w,e-a,th+e,r);
r=e="  DISPLAY'http://www.avbrief.com/' *>"-~b,exit(~l-printf(w,e+~a,th+e,r));}
