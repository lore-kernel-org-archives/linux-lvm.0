Date: Sun, 3 Oct 1999 12:14:15 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] LVM, raw-io, devfs
Message-ID: <19991003121415.A30243@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <006201bf0bb7$6eae4a60$030116ac@fd1> <14324.58266.920834.895229@dukat.scot.redhat.com> <002e01bf0cf8$b4667720$030116ac@fd1>
Mime-Version: 1.0
In-Reply-To: <002e01bf0cf8$b4667720$030116ac@fd1>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fernando Dammous <ferdam@internetcom.com.br>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Linux LVM msede <linux-lvm@msede.com>

Fernando Dammous (ferdam@internetcom.com.br) wrote :

> HI Stephen and everybody,
> 
> > I've never tried the raw IO code on 2.0: let me know how it goes!  In
> > principle, there is no reason why raw IO on LVM should not work.
> >
> > --Stephen
> >
> 
> I prefer to update my kernel (to 2.3.18 or even to wait for the 2.4), before
> and then to use RAW-IO.
> I just hope I can simply alter Oracle to use RAW-IO instead of having
> reinstall it.

Forget it, Linux port of Oracle DB doesn't support raw-io.

> Using Oracle with LVM is already very good, with RAW-IO it will be better (I
> believe).
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
