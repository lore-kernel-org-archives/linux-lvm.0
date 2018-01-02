Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41EAE60C94
	for <linux-lvm@redhat.com>; Tue,  2 Jan 2018 19:16:37 +0000 (UTC)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F119642
	for <linux-lvm@redhat.com>; Tue,  2 Jan 2018 19:16:36 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id u25so25999362pfg.5
	for <linux-lvm@redhat.com>; Tue, 02 Jan 2018 11:16:36 -0800 (PST)
Received: from hurricane.ee.washington.edu
	(D-69-91-162-151.dhcp4.washington.edu. [69.91.162.151])
	by smtp.gmail.com with ESMTPSA id
	v134sm72744766pgb.18.2018.01.02.11.16.34 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jan 2018 11:16:34 -0800 (PST)
References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
	<d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
	<20180102184334.GA22713@agk-dp.fab.redhat.com>
From: Gordon Messmer <gordon.messmer@gmail.com>
Message-ID: <116c5469-6f65-b750-d207-2f1e09f9fe8f@gmail.com>
Date: Tue, 2 Jan 2018 11:16:34 -0800
MIME-Version: 1.0
In-Reply-To: <20180102184334.GA22713@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 01/02/2018 10:43 AM, Alasdair G Kergon wrote:
> The key concept to grasp is that LVM works with devices (i.e. major
> number + minor number pairs) rather than filesystem paths and it makes a
> single "use or ignore" decision for each device (not for each path).


That seems even more misleading than the original documentation, since 
the filters are applied to each path, and not to the device.

I understand what you mean, now, but I don't think that explaining the 
system that way is likely to help users understand.

I'll send a patch later which might be more clear.  Should I send it to 
this list?  Martian (or Marian?  Signature didn't match the From header 
on an earlier message) said that they'd also send a patch, but I'm not 
sure where it will be sent.

BTW, simply removing the "a" filter solved my problem.  My vm_*_data LVs 
are no longer processed, but the md device that backs the primary VG is, 
so everything works as I expect it to. Thanks, again.
