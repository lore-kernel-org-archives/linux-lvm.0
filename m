Message-ID: <1010543196.3c3baa5c40c49@www.snappymail.ca>
From: IpSo <ipso@snappymail.ca>
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>    <1010343969.3c38a0214056f@www.snappymail.ca>    <20020106152433.Q12868@lynx.no> <1010359883.3c38de4b3692f@www.snappymail.ca>
In-Reply-To: <1010359883.3c38de4b3692f@www.snappymail.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] A way to bypass LVM and extract the raw data off?
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
Date: Tue Jan  8 20:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, it doesn't look like there is a way I can recover my LVM volume groups and
whatnot. (See below) But I know theres a fully intact ReiserFS of 17315mb on
/dev/hda6. "gpart" scanned my disk and came up with this: 

Possible extended partition at offset(249mb)
   Possible partition(Linux LVM physical volume), size(17315mb), offset(2280mb)
      type: 142(0x8E)(Linux LVM physical volume)
      size: 17315mb #s(35461377) s(4670127-40131503)
      chs:  (1023/15/63)-(1023/15/63)d (4633/1/1)-(39812/15/63)r
      hex:  00 0F FF FF 8E 0F FF FF AF 42 47 00 01 19 1D 02

End scan.

Is there some way to "dd" the data off onto another partition and access it
there? Because I know the filesystem was only on a single PV, and a single LV,
and the problems occured when trying to extend that LV, but I never got to the
point of extending the filesystem itself with reiser_resize. You would think I
could somehow using the offsets given above create a new partition to copy the
data to, run a reiserfsck and rebuild the file system so I can access the data?
Has anyone tryed something along these lines before?


Quoting IpSo <ipso@snappymail.ca>:

> [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdc
> /dev/hdc - pv_read(): PV identifier invalid
> 
> [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdc1
> Error: number of PVs passed in does not match number of PVs in /dev/hdc1's
> VG
>        2 PVs were passed in and 3 were expected.
> 
> It seems whichever combination I use, it either wants 2 or 3 PVs. 
> 
> Quoting Andreas Dilger <adilger@turbolabs.com>:
> 
> > On Jan 06, 2002  11:06 -0800, IpSo wrote:
> > > A follow up to this, I downloaded uuid_fixer to see if it would help,
> > here's
> > > what I tried:
> > > 
> > > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6
> > > Error: number of PVs passed in does not match number of PVs in
> /dev/hda6's
> > VG
> > >        1 PVs were passed in and 2 were expected.
> > > 
> > > 
> > > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6
> > > Error: number of PVs passed in does not match number of PVs in
> /dev/hdb6's
> > VG
> > >        2 PVs were passed in and 3 were expected.
> > > 
> > > Hrmm, so it must be looking for the partition I deleted on /dev/hdc. :(
> I
> > > re-created the partition just to see:
> > > 
> > > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6 /dev/hdc1
> > > Error: number of PVs passed in does not match number of PVs in
> /dev/hda6's
> > VG
> > >        3 PVs were passed in and 2 were expected.
> > 
> > Try hda6 and hdc, since this is what you had in the VG before you shut
> > down.
> > 
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> 
> IpSo
> 
> --------------------------------------------------------------------
> Never worry about viruses in your Email again.
> Get your FREE! virus scanned Email accounts at http://snappymail.ca
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


IpSo

--------------------------------------------------------------------
Never worry about viruses in your Email again.
Get your FREE! virus scanned Email accounts at http://snappymail.ca
