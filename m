Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA38ktKc014617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 Nov 2015 03:46:55 -0500
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mx1.redhat.com (Postfix) with ESMTPS id CE0693CB28B
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2015 08:46:53 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so78439214wme.0
	for <linux-lvm@redhat.com>; Tue, 03 Nov 2015 00:46:52 -0800 (PST)
MIME-Version: 1.0
Sender: d.milivojevic@gmail.com
In-Reply-To: <2A631378-1EA3-4E2A-A788-EA85824A7A3A@ankh.org>
References: <CAE8gLh=cgQLwZeXZGSVw06dt2U0F0XyzmYfY8EaFcksjv2uUsA@mail.gmail.com>
	<563369C3.9020506@redhat.com>
	<2A631378-1EA3-4E2A-A788-EA85824A7A3A@ankh.org>
From: =?UTF-8?Q?Dragan_Milivojevi=C4=87?= <galileo@pkm-inc.com>
Date: Mon, 2 Nov 2015 15:05:32 +0100
Message-ID: <CALtW_ahjuk9-UD4WdQZ3q8rRZ=r5aZCPmRvehep0GbcJ0Z01-Q@mail.gmail.com>
Subject: Re: [linux-lvm] md: personality for level 1 is not loaded
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 30, 2015 at 2:23 PM, James Hawtin <oolon@ankh.org> wrote:
> I find it is important with md to make sure your /boot or / if you do not
> have one uses metadata version 0.90 which sticks the metadata at the end of
> the disk, not the beginning. Grub does not really understand metadisk
> however a mirrored fs with metadata at the end can be read read only like a
> normal fs, and that is how it works.

grub2 fully supports raid so grub should not be an issue, 0.9 metadata
is quite ancient
and should not be used. Metadata 1.0 (1.0 not 1) should be used with
boot loaders
that do not understand raid (EFI ESP is a good use case for 1.0 metadata).

Dragan
