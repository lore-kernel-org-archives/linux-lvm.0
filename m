Message-Id: <1010359883.3c38de4b3692f@www.snappymail.ca>
From: IpSo <ipso@snappymail.ca>
Subject: Re: [linux-lvm] VG dissappeared without a trace?
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
    <20020106152433.Q12868@lynx.no>
In-Reply-To: <20020106152433.Q12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sun Jan  6 17:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

[root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdc
/dev/hdc - pv_read(): PV identifier invalid

[root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdc1
Error: number of PVs passed in does not match number of PVs in /dev/hdc1's VG
       2 PVs were passed in and 3 were expected.

It seems whichever combination I use, it either wants 2 or 3 PVs. 

Quoting Andreas Dilger <adilger@turbolabs.com>:

> On Jan 06, 2002  11:06 -0800, IpSo wrote:
> > A follow up to this, I downloaded uuid_fixer to see if it would help,
> here's
> > what I tried:
> > 
> > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6
> > Error: number of PVs passed in does not match number of PVs in /dev/hda6's
> VG
> >        1 PVs were passed in and 2 were expected.
> > 
> > 
> > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6
> > Error: number of PVs passed in does not match number of PVs in /dev/hdb6's
> VG
> >        2 PVs were passed in and 3 were expected.
> > 
> > Hrmm, so it must be looking for the partition I deleted on /dev/hdc. :( I
> > re-created the partition just to see:
> > 
> > [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6 /dev/hdc1
> > Error: number of PVs passed in does not match number of PVs in /dev/hda6's
> VG
> >        3 PVs were passed in and 2 were expected.
> 
> Try hda6 and hdc, since this is what you had in the VG before you shut
> down.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
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
