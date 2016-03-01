References: <20160229113527.86B9813A1097@snark.thyrsus.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56D595AB.9010701@redhat.com>
Date: Tue, 1 Mar 2016 14:14:19 +0100
MIME-Version: 1.0
In-Reply-To: <20160229113527.86B9813A1097@snark.thyrsus.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems in lvmconfig.8, lvm-dumpconfig.8,
 lvreduce.8, lvresize.8, vgchange.8
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
To: LVM general discussion and development <linux-lvm@redhat.com>, esr@thyrsus.com

Dne 29.2.2016 v 12:35 esr@thyrsus.com napsal(a):
> This is automatically generated email about markup problems in a man
> page for which you appear to be responsible.  If you are not the right
> person or list, please tell me so I can correct my database.
>
> See http://catb.org/~esr/doclifter/bugs.html for details on how and
> why these patches were generated.  Feel free to email me with any
> questions.  Note: These patches do not change the modification date of
> any manual page.  You may wish to do that by hand.
>
> I apologize if this message seems spammy or impersonal. The volume of
> markup bugs I am tracking is over five hundred - there is no real
> alternative to generating bugmail from a database and template.
>
> --
>                               Eric S. Raymond

Hi

Thanks for report.

I've tried to fix them (though differently) since proposed changes
were not always correct.

> --- lvreduce.8-unpatched	2016-02-29 05:58:16.401086143 -0500
> +++ lvreduce.8	2016-02-29 06:00:39.252717531 -0500
> @@ -16,7 +16,7 @@
>   .RB [ \-\-noudevsync ]
>   .RB { \-l | \-\-extents
>   .RI [ \- ] LogicalExtentsNumber [ % { VG | LV | FREE | ORIGIN "}] |"
> -.RB [ \-L | \-\-size
> +.RB [ \-L | \-\-size ]

Here we use a different logic - otherwise we would have a full man page of []
chars.

So ATM whenever there is short & long option format - we are not using [] 
around them and we just use [] around the whole option.

e.g.:

[-l|--extents  ExtentsNumber]


> Problems with vgchange.8:
>
> Invalid option format - cannot have optional prefix in token,
> it confuses anything trying to do syntactic parsing.
>
> --- vgchange.8-unpatched	2016-02-29 06:18:37.129937328 -0500
> +++ vgchange.8	2016-02-29 06:24:27.177036131 -0500
> @@ -40,7 +40,7 @@
>   .IR MaxPhysicalVolumes ]
>   .RB [ \-\-metadataprofile
>   .IR ProfileName ]
> -.RB [ \-\- [ vg ] metadatacopies ]
> +.RB [ \-\-vgmetadatacopies
>   .IR NumberOfCopies | unmanaged | all ]
>   .RB [ \-P | \-\-partial ]
>   .RB [ \-s | \-\-physicalextentsize
> @@ -234,7 +234,7 @@
>   in the volume group unless the logical volume itself has its own profile
>   attached. See \fBlvm.conf\fP(5) for more information about \fBmetadata profiles\fP.
>   .TP
> -.BR \-\- [ vg ] metadatacopies " " \fINumberOfCopies | \fIunmanaged | \fIall
> +.BR \-\- vgmetadatacopies " " \fINumberOfCopies | \fIunmanaged | \fIall


Not really sure what we can do with these - since we have couple other similar 
one.

lvm2 does support  'optional' prefix so the user can use shorter variant.

--vgmetadatacopies  or just  --metadatacopies
--raidmaxrecoveryrate  or  just --maxrecoveryrate

We can probably just put both option in full form to the list - but this
form  --[vg]metadatacopies just looks easier to read and saves space ;)

So are we violating some basic 'man-page-writting' rule - or just the catb 
parser is not capable of reading it?

IMHO I've already checked many many other man pages and there is a lot of 
different styles - so it's quite unclear how to write it properly.

As of now - page for 'lvcreate.8' is basically the style we are heading to.
(and lot's of pages still needs to be updated).


Zdenek
