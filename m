References: <08e2dced-aa3e-165c-366b-0676a30cd20a@assyoma.it>
	<489f3799-e047-bc6d-6de4-941a61252fbb@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <c5bc8fa2-6fbd-54cd-f82d-bc3913b26406@assyoma.it>
Date: Mon, 21 Nov 2016 11:08:11 +0100
MIME-Version: 1.0
In-Reply-To: <489f3799-e047-bc6d-6de4-941a61252fbb@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Underlying physical volume resized?!
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>


 > On 18/11/2016 04:43, Marian Csontos wrote:
>
> Hi, the warning was added only recently - commit c0912af3 added 2016-01-22:
>
> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=c0912af3104cb72ea275d90b8b1d68a25a9ca48a

Ok, this explain why I only recently saw this warning

> Were the partitions created by anaconda?
> This might be an installer bug.
>
> LVM allows overriding PV size to be larger than device size.
>
> More about the feature here:
> https://bugzilla.redhat.com/show_bug.cgi?id=1323950
>
> I do not think pvmove could help here, as there will be read errors on
> the device.

This a cloud VM not directly installed by me, rather from the cloud 
provider. I think they somewhat messed up their template partition table 
but, with no warning and no apparent error, the problem was unrecognized

> Deactivating swap (`swapoff /dev/$VG/$LV`)
> deleting the swap LV (`lvremove $VG/$LV`)
> shrinking the PV (simply running `pvresize /dev/sda2` without arguments),
> recreating the swap LV (`lvcreate -n $LV -L $SIZE $VG`),
> `mkswap /dev/$VG/$LV`
> and `swapon /dev/$VG/$LV`
> should do.

This is a production machine, so I am somewhat reluctant to shrink 
swap/physical volumes. From what I understand (and from my own testing 
on a test machine) this slight discrepancy between partition and PV 
*should* pose no problems to my setup. At most, when swap is full, I can 
receive an error about a failed page swapping.  Is this assumption correct?

Thank you very much.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
