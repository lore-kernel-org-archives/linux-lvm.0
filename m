Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683970@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] LVM don't work anymore (wrong version?)
Date: Fri, 16 Feb 2001 08:41:53 +0100
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Try running 'pvdata -U' on each of the PV's, and see if there 
> are empty
> UUID slots on some of them.  This is a bug with the old LVM tools.  If

I have 13 slots and the 13th is EMPTY. Is that what you mean?

> this is true, you can try to comment out the section in 
> pv_read_all_pv_of_vg
> which verifies the UUIDs (starts like "if (uuids) {"), and try vgscan
> again.

I did it and vgscan output nothing about Volume Groups!
Output of debug vgscan is attached.

Here is the output of a vgchange:
[root@fatboy 0.9.1_beta4]# echo -ne "NOTSURE_HDX\0" > /etc/lvmtab
[root@fatboy 0.9.1_beta4]# vgchange -ay
vgchange -- ERROR: physical volume "/dev/hdc9" of volume group "NOTSURE_HDX"
is inconsistent
vgchange -- run vgscan

FYI, I have hda1, hda5->hda10 + hdc1, hdc5->hdc10 in the VG NOTSURE_HDX.
hdc9 seems broken, but why? And how to restore?

What do you think?
I'm in big trouble no?

Bye
-jec
