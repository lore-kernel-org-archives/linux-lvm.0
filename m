Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TABs6g024104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 06:11:54 -0400
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 199576314F
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 10:11:53 +0000 (UTC)
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
	<1009262601.20160429104420@marki-online.net>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <5723322A.3060702@assyoma.it>
Date: Fri, 29 Apr 2016 12:06:34 +0200
MIME-Version: 1.0
In-Reply-To: <1009262601.20160429104420@marki-online.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] about the lying nature of thin
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
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>



On 29/04/2016 10:44, Marek Podmaka wrote:
> Hello Xen,
> Now I'm not sure what your use-case for thin pools is.
>
> I don't see it much useful if the presented space is smaller than
> available physical space. In that case I can just use plain LVM with
> PV/VG/LV. For snaphosts you don't care much as if the snapshot
> overfills, it just becomes invalid, but won't influence the original
> LV.
>

Let me add one important use case: have fast, flexible snapshots.

In the past I used classic LVM to build our virtualization servers, but 
this means I was basically forced to use a separate volume for each VM: 
using a single big volume and filesystem for all the VMs means that, 
while snapshotting it for backup purpose, I/O become VERY slow on ALL 
virtual machines.

On the other hand, thin pools provide much faster snapshots. On the 
latest builds, I begin using a single large thin volume, on top of a 
single large thin pool, to host a single filesystem that can be 
snapshotted with no big slowdown on the I/O part.

I understand that it is a tradeoff - classic LVM mostly provides 
contiguous blocks, so fragmentation remain quite low, while thin 
pools/volumes are much more prone to fragament, but with large enough 
chunks it is not such a big problem.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
