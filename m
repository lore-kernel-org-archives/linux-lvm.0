Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1EHhYHc013876
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 12:43:34 -0500
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1EHhNUr016736
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 12:43:24 -0500
Received: by bwz15 with SMTP id 15so5869637bwz.33
	for <linux-lvm@redhat.com>; Mon, 14 Feb 2011 09:43:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110214103112.4fb76864@bettercgi.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
Date: Mon, 14 Feb 2011 11:43:16 -0600
Message-ID: <AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
From: Jeff <jlar310@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvcreate and lvremove --quiet option is not quiet
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Mon, Feb 14, 2011 at 10:31 AM, Ray Morris <support@bettercgi.com> wrote:
>> �My general scripting philosophy is that automation scripts that
>> do not have errors should not generate output that will cause cron
>> to send an email.
>
>> So... I grabbed the source code and started nosing around.
>
> So we'll look forward to seeing your patches I hope?

This is the first time I've ever even looked at LVM source code. I'm
not sure I can be trusted with patches. Thinking about it some more, I
was wondering if the log_info macro is purely for syslog
functionality.  I could be barking up the wrong tree in terms of my
suggested approach.  I would rather leave this to someone with
experience if the behavior can be agreed upon.

> It does seem logical that it shouldn't produce informational
> messages on stdout with --quiet.
>
> As to the first part, that got me thinking about the general rule.
> Is it generally agreed that commands which do not have errors "should
> not generate output" or that commands which do not have ERRORs "should
> not generate output on standard ERROR?
>
> The OP said that these messages are on stdout, not stderr. �I'm
> kind of thinking that's right. No errors, nothing on standard error.
> If using --quiet, then no standard output. �If lacking a quiet option,
> then cron jobs should redirect stdout to /dev/null, sending mail if
> there are errors on stderr. �Thoughts?
> --
> Ray Morris
> support@bettercgi.com

I agree completely with your assessment. The only issue I wanted to
raise is that a quiet option is advertised, but it does not get the
job done.

Jeff

> On Mon, 14 Feb 2011 09:46:05 -0600
> Jeff <jlar310@gmail.com> wrote:
>
>> Background: I am using lvm snapshots in a backup script. My general
>> scripting philosophy is that automation scripts that do not have
>> errors should not generate output that will cause cron to send an
>> email.
>>
>> I am using Ubuntu 10.04 with lvm2.02.54-1ubuntu4.
>>
>> Even with the --quiet option I get "Logical volume <name> created" on
>> stdout with lvcreate and "Logical volume <name> successfully removed"
>> with lvremove.
>>
>> So... I grabbed the source code and started nosing around. In
>> lv_manip.c, I find that these messages are produced with a call to the
>> function log_print. log_print is a macro (in log.h) for
>> LOG_LINE(_LOG_WARN, args). So it looks like the logging system sees
>> these messages as warnings and is printing them even though verbosity
>> is turned down as far as possible. In addition to --quiet on the
>> command line, I have verbose = 0 in lvm.conf which according to the
>> man page "should produce no output".
>>
>> >From my point of view, lv_manip.c should be calling the log_info
>> >macro
>> for these messages and not log_print, thus giving the user control
>> over the output as advertised by the documentation. Disclaimer: I did
>> not dig into the source code far enough to be assured that log_info
>> will generated the proper results, but it certainly appears on the
>> surface to be the right option.
>>
>> I also downloaded the latest source tarball (2.0.2.84) and the
>> situation appears to be the same.
>>
>> Jeff
