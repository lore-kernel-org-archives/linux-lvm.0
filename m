Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <ac8rs15d9td9ke80r4mt1d2i294n99id4k@4ax.com>
References: <ac8rs15d9td9ke80r4mt1d2i294n99id4k@4ax.com>
Message-Id: <19be7debf29ebfd90339976d288dce0d@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] "vg doesn't exist" after removing a pv
Date: Fri, 20 Jan 2006 11:40:42 -0600
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lists@tnotd.net, LVM general discussion and development <linux-lvm@redhat.com>

There may be a better way, but here is what I did...

 > vgcfgrestore <VG>

Errors out, but gives you the uuid of the PV that is missing.

 > pvcreate -u <uuid given by failed command> <device>
 > vgcfgrestore <VG>

All should be good now.

  brassow
On Jan 18, 2006, at 4:37 PM, Alan Wise wrote:

>
> I just attempted to remove two physical volumes from one of my volume
> groups.  Since I very recently added them, I knew (or thought I knew)
> that there was no data on them so I attempted to to remove them using
> "pvremove /dev/hda8 /dev/hdb1".
>
> The program complained, but suggested I try using the "-ff" option,
> which I promptly did, without considering the consequences of my
> actions (or backing up the data).
>
> Now I'm getting the following errors:
>
> Couldn't find device with uuid "..."
> Couldn't find all physical volumes for volume group my_vg
> Volume group "my_vg" doesn't exist
>
> Unfortunately, being rather new to LVM, I didn't know about
> vgcfgbackup until I started researching how to fix my problem, so I
> can't go that route.
>
> Is there any way I can recover my data.  Any help would be MUCH
> appreciated.
>
> Alan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
