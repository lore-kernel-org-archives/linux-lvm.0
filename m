Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AABD05D6A9
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2017 18:11:27 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 329B0C0587E4
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2017 18:11:18 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 30 Oct 2017 19:11:16 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20171030170451.GB28695@redhat.com>
References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
	<20171030170451.GB28695@redhat.com>
Message-ID: <02763e2a9b9872a01a7a0e4e54e2230e@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?When_and_why_vgs_command_can_change_metadat?=
	=?utf-8?q?a_and__incur_old_metadata_to_be_backed_up=3F?=
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
Cc: Eric Ren <zren@suse.com>

Il 30-10-2017 18:04 David Teigland ha scritto:
> On Mon, Oct 30, 2017 at 02:06:45PM +0800, Eric Ren wrote:
>> Hi all,
>> 
>> Sometimes, I see the following message in the VG metadata backups 
>> under
>> /etc/lvm/archive:
>> 
>> """
>> contents = "Text Format Volume Group"
>> version = 1
>> 
>> description = "Created *before* executing 'vgs'"
>> """
>> 
>> I'm wondering when and why the new backups will be created by 
>> reporting
>> command like vgs?
> 
> It's probably a case where lvm sees something wrong after reading the 
> VG
> metadata, and automatically tries to fix it, writing a corrected 
> version
> of the metadata to disk.  This means that even a command that only 
> reads
> and reports lvm information can potentially write to disk.

Interesting. Eric, can you show the *before* and *after* vgs textual 
metadata (you should find them in /etc/lvm/archive)?

> that in theory are only reading and reporting information.  I've also
> suggested that whenever repairs are done, lvm should record a 
> persistent
> message in the system log with the details, but that idea didn't get a
> great reception.

Just to know: why the idea of syslog reporting was discarded?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
