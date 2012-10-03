Received: from tasleson.csb (vpn-226-68.phx2.redhat.com [10.3.226.68])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q93EaC0t018258
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2012 10:36:12 -0400
Message-ID: <506C4D5C.8080103@redhat.com>
Date: Wed, 03 Oct 2012 09:36:12 -0500
From: Tony Asleson <tasleson@redhat.com>
MIME-Version: 1.0
References: <CAMwsLt6D7c6YDHFHiBufNGDtVG+_soqo1OK9Kg4pV7L1WuPhMA@mail.gmail.com>
In-Reply-To: <CAMwsLt6D7c6YDHFHiBufNGDtVG+_soqo1OK9Kg4pV7L1WuPhMA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM2APP still under active development?
Reply-To: tasleson@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

On 10/02/2012 04:42 AM, Bram Klein Gunnewiek wrote:
> Hello,
> 
> I'm developing an in-house application that needs to control LVM
> set-ups. I was looking at the lvm2app API but its missing a couple of
> features I need (snapshots, resizing logical volumes (API is defined
> but not implemented), ...). I can't find any road-map or document
> with plans for the API (only the v1 document at
> http://fedoraproject.org/wiki/LVM/liblvm ).
> 
> Is the API still under active development, and are new features
> added?

The API is getting some attention.  Current plan is to add feature
parity python bindings to API (patches pending) and then add features to
the API.  Some of the initial planned improvements include:

- PV (create/resize/remove/enumerate & query)
- VG (activate/deactivate)
- LV (Ability to enumerate information directly without enumerating VGs
  first)
- Dry run feature,  the ability to do multiple changes while checking
  for errors and examine the end resulting end configuration before
  applying changes

The long term goal is to achieve feature parity with the command line.

> I rather use a stable API instead of wrapping around CLI commands,
> but mixing the two to use the functionality the API is missing
> doesn't seem a smart option to me.

We agree.

Regards,
Tony
