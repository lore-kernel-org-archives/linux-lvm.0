Return-Path: <lembark@wrkhors.com>
Date: Sat, 21 Jul 2001 23:40:29 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Help.
Message-ID: <424370000.995776829@dizzy>
In-Reply-To: <3B5A585F.1070003@texas.net>
References: <3B5A585F.1070003@texas.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com

- Ben Konosky <bkonosky@texas.net> on 07/21/01 23:36:47 -0500:

> I had a VG that had three PVs in it, one of the PVs failed, is there any 
> way to trick the VG into thinking it only has two PVs in it so I can 
> *try* to mount it and see what data I can pull off the remainder. The 
> file system is reiserfs, and it was the third PV in the group that died.

vgexport and import it back with the valid PV's.  You'll loose whatever
was on the missing PV.  If any of the LV's spanned PV's then you'll loose
those LV's.

sl
