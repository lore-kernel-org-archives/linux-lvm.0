References: <40cdc28f-ad90-a7b8-9a66-89439111703a@hale.ee>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <cbdc3274-3353-719e-8a03-281aad9da60d@redhat.com>
Date: Mon, 18 Sep 2017 13:49:20 +0200
MIME-Version: 1.0
In-Reply-To: <40cdc28f-ad90-a7b8-9a66-89439111703a@hale.ee>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Tom Hale <tom@hale.ee>

Dne 18.9.2017 v 09:52 Tom Hale napsal(a):
> Hi,
> 
> MAN PAGE
> 
> In http://man7.org/linux/man-pages/man8/pvscan.8.html I see the
> following issues:
> 
> * The string "-a--activate" appears several times. Should be:
>    "-a|--activate"
> 
> * "-a|--activate y|n|ay" is mentioned, but later on:
> "Only ay is applicable." Please remove "y|n|".
> 
> PROGRAM
> 
> # pvscan --activate ay
>    Command does not accept option: --activate ay.
> 
> The message is confusing. It would be better to say "--activate requires
> --cache"
> 
> In fact, why not drop the "ay" argument all together and just allow
> "--cache --activate"?

Hi

In general - we use internal logic for parsing options and its parameters and 
in this case the options 'takes' more parameters then 'pvscan' can accept.

We could possibly add 'extra' special  option  e.i. :
--pvscanautoactivation

but we've considered at given time it's not worth since normally no user is 
ever supposed to use it in regular user space (since noone likes to see more 
and more individal options doing nearly the same thing)

This option is mostly targeted for execution inside  udev rules  - and since 
there was some 'evolution' how to make this working - it's now not really 
worth to make it more complicated - since we would have to keep old option 
present anyway for backward compatibility.

Regards

Zdenek
