Date: Mon, 21 Sep 2009 23:24:36 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] extend lv fails: invalid argument and failed to
	suspend
Message-ID: <20090921222436.GG1210@agk-dp.fab.redhat.com>
References: <4AB7F839.4000602@iinet.net.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4AB7F839.4000602@iinet.net.au>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Timms <dtimms@iinet.net.au>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 22, 2009 at 08:03:37AM +1000, David Timms wrote:
>   /dev/sdc3  vg1  lvm2 a-    48.41G 13.88G  34.59G  
> z6zl0h-oiRp-jJ12-KpDA-X11g-y2YH-hKjx9U

>   lvhome  vg1     1 -wi-ao  21.53G  -1  -1 253  1                     
> 2qxr1c-ObDr-BedT-B8Aq-6fBE-81tW-3mQvuP
>   lvslash vg1     1 -wi-ao  12.00G  -1  -1 253  0                     
> A72rig-0oMK-KgVt-k6vo-rq7O-PKX0-koudNn
>   lvswap  vg1     1 -wi-ao   1.00G  -1  -1 253  2                     
> 7JzPLM-qqYs-Y4r4-SYdi-9M3j-7teZ-mNqVgW

> (DevSize) - (PSize) = (PFree)
>  34.59G - 48.41G = -13.82  /= 13.88
> , which looks like a bug in at least pvs !

Not really.

Somehow your PV is defined to be bigger than the disk it is currently on.
Ways this can happen include the /dev/sdc partition table getting changed
incorrectly, deliberately overriding the device size when creating it,
restoring from metadata backups incorrectly or using 'dd' to copy device
metadata.

> Any ideas on how to solve this ?

You need to start by reviewing your /dev/sdc partition table and making
sure all space on there is accounted for in partitions in the way you
expect: How big is sdc? Where and how big are sdc1 and sdc2?  Is there
any space on the disk not included in sdc1/2/3 ?

Alasdair
