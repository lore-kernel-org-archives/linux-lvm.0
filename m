Date: Mon, 18 Sep 2017 10:56:13 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170918155613.GA6025@redhat.com>
References: <40cdc28f-ad90-a7b8-9a66-89439111703a@hale.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40cdc28f-ad90-a7b8-9a66-89439111703a@hale.ee>
Subject: Re: [linux-lvm] pvscan: bugs in manpage and implementation
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
To: Tom Hale <tom@hale.ee>
Cc: linux-lvm@redhat.com

On Mon, Sep 18, 2017 at 02:52:04PM +0700, Tom Hale wrote:
> Hi,
> 
> MAN PAGE
> 
> In http://man7.org/linux/man-pages/man8/pvscan.8.html I see the
> following issues:
> 
> * The string "-a--activate" appears several times. Should be:
>   "-a|--activate"

Yes, that's odd, the | exists in the source, but isn't being printed.
I'll just change to --activate for now.

> * "-a|--activate y|n|ay" is mentioned, but later on:
> "Only ay is applicable." Please remove "y|n|".

Unfortunately --activate is one of those options that was given different
acceptable values depending on the command, and we haven't added a special
case to the code that generates man pages to display it differently.

> PROGRAM
> 
> # pvscan --activate ay
>   Command does not accept option: --activate ay.
> 
> The message is confusing. It would be better to say "--activate requires
> --cache"

Yes, this is a limitation in the new code that matches what you have typed
to a specific command.  All possible commands are now defined here:
https://sourceware.org/git/?p=lvm2.git;a=blob_plain;f=tools/command-lines.in;hb=HEAD

It matches 'pvscan --activate' to the 'pvscan' command (which doesn't
accept -a, thus the error), rather than to the 'pvscan --cache' command
(which does accept -a).
