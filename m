Received: from [10.34.131.78] (dhcp131-78.brq.redhat.com [10.34.131.78])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB1AjRJa021873
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2015 05:45:28 -0500
References: <CAKPOGq6dD_UXaP5EoTfuiv3vJ+den4_4VpvhEQcX3-6LNQd7ZQ@mail.gmail.com>
	<CAKPOGq4moLpBysQ=PenzGj0Xt98eV5ewTgynnfqJJRhVOYHdcw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <565D7A46.9030002@redhat.com>
Date: Tue, 1 Dec 2015 11:45:26 +0100
MIME-Version: 1.0
In-Reply-To: <CAKPOGq4moLpBysQ=PenzGj0Xt98eV5ewTgynnfqJJRhVOYHdcw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fwd: Questions about residual data in LVM after
 delete the Logic Volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.11.2015 v 13:28 Young Yang napsal(a):
>
> ---------- Forwarded message ----------
> From: *Young Yang* <afe.young@gmail.com <mailto:afe.young@gmail.com>>
> Date: Thu, Nov 26, 2015 at 4:20 PM
> Subject: Questions about residual data in LVM after delete the Logic Volume
> To: linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>
>
>
> Hi
>
> This is my LVM version
>
>     stack@DevStackOSDomU:~$ sudo lvm version
>        LVM version:     2.02.98(2) (2012-10-15)
>        Library version: 1.02.77 (2012-10-15)
>        Driver version:  4.27.0
>
>
> I created a 1GB physical volume with a block device setup by losetup,  and
> added it to my volume group.
> Then I created a 1GB logic volume  A  and  I can find my block device
> here /dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac1f-23e3e825e576.
>
> I mount this Logic volume and write some data containing a string PATTERN
>   into it.
> Then I grep the block device with  `sudo grep -zbl PATTERN
> /dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac1f-23e3e825e576`
>   and   It really have found the string  PATTERN
>
> Then I deleted this 1GB logic volume A  and created another  1GB logic volume.B.
> I expected  the residual data containing string PATTERN should appear in the
> 1GB logic volume B, because they both used all the same 1GB physical volume.
> However, when I grep the  1GB logic volume B's block device directly,  it
> return nothing.
>
>
>
> *So Here comes the quesions,*
>
> Does LVM have any mechanism to prevent the residual data in the previously
> deleted logical volume from  appearing in the new logical volume?
> If there is any, how can I config it?  How  does it work , where can I find
> the related  docs?



Nope - lvm2 as "L"ogical "V"olume "M"anager does not zero user's data.

If you do not want to 'leak' your data after use - simply 'zero'  LV before 
it's being removed (might be quite lengthy operation)

If you use 'SSD' and you have some kind of 'trust' into discard/trim - you
may setup sending of discard on deleted extents (however note - you cannot
revert back with  'vgcfgrestore' your LV removal operation.

You could also switch into 'thin-provisioning' - which does provide 'zeroing'
of new provisioned blocks - depends on your use-case - but then you are 
STRONGLY advised to switch to some modern distro and not 3 years old one....

And also the most secure option is - encrypt LV (dm-crypt)
this way you simply don't care what does exist in blocks since without proper 
key data are just white noice...

Regards

Zdenek
