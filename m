References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
	<aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
	<b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
	<eff2bc4d-8008-7c02-cbdb-ac6ef66129f8@redhat.com>
	<25ba200c-7c26-ef51-4e89-d6c3f4dba395@assyoma.it>
	<0a3aa51f-ef59-9330-2b74-0891ebf00c51@assyoma.it>
	<7a5221fc-6c6c-8af3-91ec-66fe68b1cdde@redhat.com>
	<c229158c-9669-ead2-ba1e-ea7d6b0d04f2@assyoma.it>
	<5fe94876-f695-0cf0-2277-e6fde5f91ba6@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <1c787533-11b9-8366-916e-5c2e9f2db367@assyoma.it>
Date: Mon, 20 Mar 2017 12:52:07 +0100
MIME-Version: 1.0
In-Reply-To: <5fe94876-f695-0cf0-2277-e6fde5f91ba6@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Possible bug in thin metadata size with Linux MDRAID
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 20/03/2017 12:01, Zdenek Kabelac wrote:
>
>
> As said - please try with HEAD - and report back if you still see a
> problem.
> There were couple issue fixed along this path.
>

Ok, I tried now with tools and library from git:

LVM version:     2.02.169(2)-git (2016-11-30)
Library version: 1.02.138-git (2016-11-30)
Driver version:  4.34.0

I can confirm that now thin chunk size is no more bound (by default) by 
MD RAID chunk. For example, having created a ~500 GB MD RAID 10 array 
with 64 KB chunks, creating a thinpool shows that:

[root@blackhole ~]# lvcreate --thinpool vg_kvm/thinpool -L 500G
[root@blackhole ~]# lvs -a -o +chunk_size
   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
   LV               VG        Attr       LSize   Pool Origin Data% 
Meta%  Move Log Cpy%Sync Convert Chunk
   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m 
                                  0
   thinpool         vg_kvm    twi-a-tz-- 500.00g             0.00   0.42 
                             256.00k
   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g 
                                  0
   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m 
                                  0
   root             vg_system -wi-ao----  50.00g 
                                  0
   swap             vg_system -wi-a-----   7.62g

Should I open a bug against the RHEL-provided packages?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
