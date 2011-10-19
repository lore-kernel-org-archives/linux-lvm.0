Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9JBMlSb029279
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 07:22:47 -0400
Received: from homiemail-a46.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JBMlwE002225
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 07:22:47 -0400
Received: from homiemail-a46.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a46.g.dreamhost.com (Postfix) with ESMTP id 085D03E406A
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 04:22:47 -0700 (PDT)
Received: from [127.0.0.1] (smtp.media-brokers.com [70.43.81.99])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a46.g.dreamhost.com (Postfix) with ESMTPSA id CC7433E4062
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 04:22:46 -0700 (PDT)
Message-ID: <4E9EB305.4070503@libertytrek.org>
Date: Wed, 19 Oct 2011 07:22:45 -0400
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
References: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
In-Reply-To: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Attempting to salvage data from a PV on a damaged
 disk
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
To: linux-lvm@redhat.com

On 2011-10-18 8:51 PM, Robert Gormley <rgormley@mgcare.com> wrote:
> The system would not boot from the "live disk" due to what appears to be a minor (but not minor enough) disk failure (SMART and other tests pass, but I get some I/O errors before operations work).

What filesystem is on the disk? Maybe you could try something like 
spinrite? I have used it successfully countless times with drives that 
have developed some bad sectors but are otherwise ok...
