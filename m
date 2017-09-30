MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 30 Sep 2017 19:31:06 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
References: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
Message-ID: <ad64038cb2e24432f2d3fc479b586154@assyoma.it>
Subject: Re: [linux-lvm] Difference between Debian and some other
	distributions with thin provisioning
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
Cc: Jan Tulak <jtulak@redhat.com>

Il 29-09-2017 18:42 Jan Tulak ha scritto:
> Debian:
> # cat /etc/debian_version
> 8.9
> # lvm version
>   LVM version:     2.02.111(2) (2014-09-01)
>   Library version: 1.02.90 (2014-09-01)
>   Driver version:  4.27.0
> 
> Centos:
> # cat /etc/redhat-release
> CentOS Linux release 7.4.1708 (Core)
> # lvm version
>   LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
>   Library version: 1.02.140-RHEL7 (2017-05-03)
>   Driver version:  4.35.0

Well, this output explains everything: Debian's LVM version is almost 3 
years older than CentOS's one.
Generally speaking, I think that CentOS/RH ages *much* better than 
Debian/Ubuntu regarding core kernel technologies (and related userspace 
tools) as thin provisioning.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
