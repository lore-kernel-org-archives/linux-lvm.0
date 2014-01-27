Received: from arthur.brq.redhat.com (vpn1-6-83.ams2.redhat.com [10.36.6.83])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s0R8pLwm003675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2014 03:51:22 -0500
Message-ID: <52E61E08.9010805@redhat.com>
Date: Mon, 27 Jan 2014 09:51:20 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAFZxf=L8_MOCBx+E6GUg_gCJ=284M2wONeASHEDXWY0io4oXjQ@mail.gmail.com>
In-Reply-To: <CAFZxf=L8_MOCBx+E6GUg_gCJ=284M2wONeASHEDXWY0io4oXjQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin provisioned LV + raid5?
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

On 01/25/2014 10:26 PM, Vasil Valchev wrote:
> Hello,
>
> I want to create a thin pool that will be used for storing virtual machines
> (inside separate thin volumes).
> The thing is I can't find if that thin pool can be at the same time --type
> raid5 (or similar) at the same time?
>
> Would something like this be possible:
>
> lvcreate -T virtvg/virtpool -L 500G --type raid5
>
> Or maybe the whole approach is wrong?
> What I want to do in the end is a thin pool/volumes that are replicated in
> some way - ideally raid5, if not - mirrored.
>
> Is this implemented and supported in LVM, or is hardware raid recommended
> to handle the redundancy in thin provisioned storage?

Hi Vasil, you have to first create the RAID5 volume first and then 
convert to pool using lvconvert.

Also if you want redundancy for data, you will likely want redundancy 
for metadata as well. RAID1 is recommended.

lvcreate -n meta --type raid1 -m 1 -L 256M virtvg
# ^ adjust number of legs (-m N)
# ^ you may want to adjust size of metadata volume, depends if you plan 
to further grow your pool in close future as metadata resize is still 
not fully working, but will soon. If my math is correct 256M should be 
enough for up to 2TB - see --poolmetadatasize.

lvcreate -n virtpool --type raid5 -i 3 -L 500G virtvg
# ^ adjust number of stripes (-i N)

lvconvert --thinpool vg/virtpool -c 64k --poolmetadata meta
# ^ adjust chunksize - if you want snapshots use smaller chunks, if you 
want to use only thin-provisioning use larger chunks. if both you have 
to compromise. Too small chunks may affect performance if you have many 
VMs issueing many concurrent writes.

-- Marian

>
>
> Regards,
> Vasil
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
