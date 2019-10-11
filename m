Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60691600C4
	for <linux-lvm@redhat.com>; Fri, 11 Oct 2019 09:27:23 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6901C883856
	for <linux-lvm@redhat.com>; Fri, 11 Oct 2019 09:27:21 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri, 11 Oct 2019 09:26:42 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 11 Oct 2019 09:22:57 +0000
Message-ID: <dd28a375-f1f5-9ae0-e843-cb67de3136a9@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
In-Reply-To: <6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
Content-Language: en-US
Content-ID: <CC569B121ABFBC4CA2AB6B88574439A1@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

Only one thing I am confusion all the time.
When read/write error, lvm will call bcache_invalidate_fd & _scan_dev_close to close fd.
So the first successfully read (i.e.: f747), which following f748 finally has fc68's fd.
This will cause f747 metadata overwrite not f748.

the sequence of disk scanning:
```
  scsi-360060e80072a670000302a670000fc69 <=== successful
  scsi-360060e80072a670000302a670000fc68 <=== first failed
  scsi-360060e80072a670000302a670000fc67
  scsi-360060e80072a670000302a670000fc66
  scsi-360060e80072a660000302a660000f74c
  scsi-360060e80072a660000302a660000f74a
  scsi-360060e80072a660000302a660000f749
  scsi-360060e80072a660000302a660000f748 (has fc68 metadata) <=== last failed
  scsi-360060e80072a660000302a660000f747 <=== first successfully read following last failed
```

Hope you understand my saying.


On 10/11/19 4:11 PM, Heming Zhao wrote:
> Hello list,
> 
> I analyze this issue for some days. It looks a new bug.
> 
> trigger steps:
> user execute pvresize to enlarge the pv.
> After the command execution, one disk lvm metadata was overwrite by another disk lvm metadata.
> 
> once log (execute pvresize cmd), there are 7 disk occur read/write failed:
> ```
> scsi-360060e80072a670000302a670000fc68
> scsi-360060e80072a670000302a670000fc67
> scsi-360060e80072a670000302a670000fc66
> scsi-360060e80072a660000302a660000f74c
> scsi-360060e80072a660000302a660000f74a
> scsi-360060e80072a660000302a660000f749
> scsi-360060e80072a660000302a660000f748 (has fc68 metadata)
> ```
> the f748 metadata was overwritten by fc68.
> 
