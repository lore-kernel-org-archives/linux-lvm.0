Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 046C042AD3
	for <linux-lvm@redhat.com>; Thu,  9 Jul 2020 00:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CC6E857CF5
	for <linux-lvm@redhat.com>; Thu,  9 Jul 2020 00:44:36 +0000 (UTC)
References: <HE1PR0402MB3514D6153AB2978268A015BDCF670@HE1PR0402MB3514.eurprd04.prod.outlook.com>
	<20200708160519.GA23533@redhat.com>
From: Gang He <ghe@suse.com>
Message-ID: <f699b25f-4962-4b47-b0ab-9ab5c944a032@suse.com>
Date: Thu, 9 Jul 2020 08:44:23 +0800
In-Reply-To: <20200708160519.GA23533@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] About online pvmove/lvresize on shared VG
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
To: David Teigland <teigland@redhat.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi David,

Thank for your reply.
more questions,

On 7/9/2020 12:05 AM, David Teigland wrote:
> On Wed, Jul 08, 2020 at 03:55:55AM +0000, Gang He wrote:
>> but I cannot do online LV reduce from one node,
>> the workaround is to switch VG activation_mode to exclusive, run lvreduce command on the node where VG is activated.
>> Does this behaviour is by-design? or a bug?
> 
> It was intentional since shrinking the cluster fs and LV isn't very common
> (not supported for gfs2).
OK, thank for confirmation.

> 
>> For pvmove command, I cannot do online pvmove from one node,
>> The workaround is to switch VG activation_mode to exclusive, run pvmove command on the node where VG is activated.
>> Does this behaviour is by-design? do we do some enhancements in the furture?
>> or any workaround to run pvmove under shared  activation_mode? e.g. --lockopt option can help this situation?
> 
> pvmove is implemented with mirroring, so that mirroring would need to be
> replaced with something that works with concurrent access, e.g. cluster md
> raid1.  I suspect there are better approaches than pvmove to solve the
> broader problem.
Sorry, I am a little confused.
In the future, we can do online pvmove when VG is activated in shared 
mode? from man page, I feel these limitations are temporary (or Not Yet 
Complete).
By the way, --lockopt option can help this situation? I cannot find the 
detailed description for this option in manpage.

Thanks
Gang

> 
> Dave
> 
