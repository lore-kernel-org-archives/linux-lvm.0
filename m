Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683CB1@mailsrv.linkvest.com>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Date: Tue, 15 May 2001 14:34:57 +0200
MIME-Version: 1.0
Subject: [linux-lvm] Lost filesystems on LVs
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I have a BIG problem. I have an LVM VG of 160Gb. There is 3 LVs defined:
- MS
- Distrib
- backups
This morning, I made a e2fsadm to reduce the MS volume and grow the backup
one.
I umounted the MS volume, made the e2fsadm. All was OK, no error.
I then umounted the backups LV and made the e2fsadm. e2fsck refused to work
saying that there was no filesystem on it! All was OK, until I umount it!
And now, I'm sticked with the backups LV with no filesystem (it was OK until
this night, all backups were OK) and the MS LV with things that I don't
understand (files that shouldn't be here...)

Any idea? Help?
thanks
-jec

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Jean-Eric Cuendet
Linkvest SA
Av des Baumettes 19, 1020 Renens Switzerland
Tel +41 21 632 9043  Fax +41 21 632 9090
http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
