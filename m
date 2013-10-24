Received: from arthur.brq.redhat.com (dhcp131-120.brq.redhat.com
	[10.34.131.120])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9OBIqTh004691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 07:18:53 -0400
Message-ID: <5269021B.5040205@redhat.com>
Date: Thu, 24 Oct 2013 13:18:51 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAFp1kvMoWy8okmvqXOg5uPCUcnRWbr9y_de4JDcCmLRk=6vLnQ@mail.gmail.com>
In-Reply-To: <CAFp1kvMoWy8okmvqXOg5uPCUcnRWbr9y_de4JDcCmLRk=6vLnQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to convert a broken LVM2 RAID1 to Linear
	volume
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

On 10/23/2013 06:50 PM, Shi Jin wrote:
> Hi there,
>
> I have setup a LVM2 raid1 mirror with
>     lvconvert  -m 1 --type raid1 /dev/vg_data/lv_test /dev/sdd
> and then after I remove one of its legs, the remaining leg keeps on
> working just fine. However, I then want to convert this to a simple
> Linux volume.
>
> it would fail:
>
> [root@shi-rhel63 ~]# lvconvert -m 0 /dev/vg_data/lv_test
>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
>    Cannot change VG vg_data while PVs are missing.
>    Consider vgreduce --removemissing.

Following worked for me except I ended up with unclean FS:

     lvconvert -m 0 --repair -f vg_data/lv_test

-- Marian

>
> removemissing not working either
>
> [root@shi-rhel63 ~]# vgreduce  --removemissing vg_data
>    Couldn't find device with uuid QpjTRd-Cc0o-RC0y-7Gz8-GQ4u-25FM-0vO4xt.
>    WARNING: Partial LV lv_test needs to be repaired or removed.
>    WARNING: Partial LV lv_test_rmeta_1 needs to be repaired or removed.
>    WARNING: Partial LV lv_test_rimage_1 needs to be repaired or removed.
>    There are still partial LVs in VG vg_data.
>    To remove them unconditionally use: vgreduce --removemissing --force.
>    Proceeding to remove empty missing PVs.
>
> What should I do in my case to convert the LV to linear?
>
> My OS information:
>
> [root@shi-rhel63 ~]#  cat /etc/redhat-release
> Red Hat Enterprise Linux Server release 6.3 (Santiago)
> [root@shi-rhel63 ~]# uname -a
> Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT
> 2012 x86_64 x86_64 x86_64 GNU/Linux
> [root@shi-rhel63 ~]# lvm version
>    LVM version:     2.02.95(2)-RHEL6 (2012-05-16)
>    Library version: 1.02.74-RHEL6 (2012-05-16)
>    Driver version:  4.22.6
>
>
> Thanks a lot.
>
> Shi
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
