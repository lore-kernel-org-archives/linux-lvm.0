Date: Wed, 12 Sep 2001 09:40:47 +0000
From: Tomas Edwardsson <tommi@tommi.org>
Subject: Re: [linux-lvm] Re: Problem with vgscan "only found 626 of 625 LEs for LV"
Message-ID: <20010912094047.A19059@hp.is>
References: <20010911112241.A16588@hp.is> <20010911113054.B16588@hp.is> <20010911104934.C29347@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010911104934.C29347@turbolinux.com>; from adilger@turbolabs.com on Tue, Sep 11, 2001 at 10:49:34AM -0600
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

Well, problem number 1. vgscan fails and therefore vgchange does also.

]# ll -d /dev/vg00
ls: /dev/vg00: No such file or directory


I ran the rest of the commands just the same since we have a backup.
After I did that it seems all LV and LE info has evaporated.

Current pvdata is http://vefur.hp.is/lvm/pvdata-hdd1-new.txt

Thanks, Tommi

On Tue, Sep 11, 2001 at 10:49:34AM -0600, Andreas Dilger wrote:
> On Sep 11, 2001  11:30 +0000, Tomas Edwardsson wrote:
> > I had already tried the vgcfgrestore, it didn't seem to help but I discovered
> > that the UUID for one of my PVs was missing so I ran the uuid-fixer and now
> > they all have UUIDs again (don't know if that is relevant). 
> > 
> > I have run the pvdata on all my PVs although I think the right one is the
> > following file run with pvdata -avP /dev/hdd1:
> >   http://vefur.hp.is/lvm/pvdata-hdd1.txt
> 
> Yes, this clearly shows that lvol1 has 625 LEs (in the LV data), but it
> has PE 0-625 from that PV assigned to it (total of 626 PEs).  I don't
> know which one is correct, nor how it got that way.  If you have a
> filesystem on that LV, you could find out how big the fs is to figure
> out which value needs fixing.  For ext2, you can do:
> 
> dumpe2fs -h /dev/vg00/lvol1
> 
> and figure out if it is 2500MB (625 LE) or 2504MB (626LE).  Then (the fun
> part) you need to go and edit either the LV table or the PE table to have
> the right numbers in it.  I'm guessing the LV table is wrong (and even if
> not, it is safer to add the PE to the end than to truncate your filesystem).
> 
> dd if=/dev/hdd1 of=/hdd.sav bs=1024 count=188		# backup LVM metadata
> dd if=/dev/hdd1 of=/lv1.dat bs=1 skip=43008 count=328	# get lvol1 metadata
> od -Ad -tx1 /lv1.dat					# show lvol1 metadata
> 
> # 625 = 0x271 which you should see at offset 300, 301 of the LV struct
> # 626 = 0x272 = 0x02 0x72, 0x72 = "r" in ASCII, so we write this into LV
> echo "r" | dd of=/lv1.dat count=1 seek=300		# write 0x72 to LE count
> 
> od -Ad -tx1 /lv1.dat					# show lvol1 metadata
> # we should now see 0x72 0x02 0x00 0x00 at offset 300 of the LV metadata
> 
> dd if=/lv1.dat of=/dev/hdd1 bs=1 seek=43008		# write LV meta to disk
> pvdata -avP /dev/hdd1					# verify all is well
> vgscan							# should be OK now
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
