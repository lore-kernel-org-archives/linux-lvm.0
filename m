Message-ID: <20030121221921.90255.qmail@web14407.mail.yahoo.com>
From: grenoml <grenoml@yahoo.com>
Subject: Re: [linux-lvm] Bare Metal Recovery/Restore
In-Reply-To: <20030113192832.32624.qmail@web14402.mail.yahoo.com>
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
Date: Tue Jan 21 16:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  Well I've been digging through man pages and this list trying to see
if I can determine the proper steps to insure a good recovery.  The
background is I lost the root drive on one of my RH8 systems.  On it
were /, /usr, /usr/local, /usr/src. / was not under LVM.  I have Amanda
backups of all the data.  I even have done a vgcfgbackup and I have all
the metadata (and the lvmconf directory) saved on another drive.  I
want to verify that my recovery steps make sense:
1. install new drive (it is identical to failed drive)
2. boot from rescue CD
3. partition new drive same as old drive (sfdisk /dev/hde <oldhde.conf)
4. run vgcfgrestore on new drive for all Volume Groups that had LV/PVs
that were present on failed drive.
5. restore / filesystem on new drive from backup tar ( I do this for /)
.
6. reboot
7. (do I need to mkfs on LVM partition here?  any special mkfs
command?)
7. install temporary version of Amanda to use for recovery
8. restore the /usr, /usr/local, and /usr/src filesystems from backup
tapes.
9. reboot
10. remove temporary Amanda install.
All should be normal?

Can it be this simple?  This seems too easy.  My concern is with step
4.  Do I need to do more than this for LVM like run lvcreate or
pvcreate?

Thanks for any guidance,
Gerry Reno



--- grenoml <grenoml@yahoo.com> wrote:
> Can someone point me to a HOW-TO for doing a full bare-metal recovery
> for a Linux system (RedHat 8.0) that is using LVM that suffered
> complete hard drive failure.  I have a full set of Amanda backup
> tapes
> that can be network mounted from tape drive on another server.  
> 
> Thanks,
> Gerry Reno
> 
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
