Message-ID: <E631530D51ABD411B823009027855C5B0278BF@THOR>
From: Murthy Kambhampaty <Murthy.Kambhampaty@goeci.com>
Subject: RE: [linux-lvm] Volume group not found on restart [resent]
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
Date: Wed May 22 14:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Heinz, 

> 
> Well, that shouldn't have happened in case "vgreduce db_vol 
> /dev/sda" went ok
> back then.
> Do you have any memory of failure messages for that one?
There weren't really any failure messages. I was just trying to go through
the steps of removing the PV from the VG, then "remove the PV", then
reformat the drive/yank it. I had a similar problem on another box, where
I'd set up a VG create an LV, use if for a while then try to scrap the
system because I needed to redeploy my HDDs. Once the vgreduce/vgremove step
was completed, I'd do a PV scan and it would still list the removed PV as
belonging to the VG or list the size of the VG at the old size. I'd reboot
and do a pvscan, and it would give the correct list of PVs/VG
membership/size of VGs; so I never thought anything of it (I have a couple
of disks to play with, once I get the data I take care of db_vol, and I will
try to replicate my experience).

> > 
> > So, the preferred course here is to "to change the metadata 
> in order to get
> > rid of the gone physical volume", and all will be well. 
> 
> So there's cons vs. (temporarly) trying 1.1-rc to quorum 
> activate db_vol
> in order to retrieve the data?
> 
Only to the extent that your message indicated that LVM 1.1-rc2 was unstable
(BTW, do I only install the userspace tools and retain my LVM 1.0.1rc4
kernel code (or do I have to patch the XFS cvs kernel with the LVM 1.1-rc2
kernel code to implement this alternative?)

Thanks,
	Murthy
