Message-ID: <146CF6C5299BD411BAE90008C78654A312420561@uklonts01.uklo.capco.com>
From: Nangle Jon <Jon.Nangle@capco.com>
Subject: RE: [linux-lvm] Can't install LVM 1.0.7 on Redhat Advanced Server
	 2.1 Please help.
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-37ffafa9-9d25-4c44-9d25-6f9624042f46"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Sep 10 11:58:03 2003
List-Id: <linux-lvm.redhat.com>
To: "'Fought,Tom '" <foughtt@oclc.org>, "''linux-lvm@sistina.com' '" <linux-lvm@sistina.com>

This is a multi-part message in MIME format.

------=_NextPartTM-000-37ffafa9-9d25-4c44-9d25-6f9624042f46
Content-Type: text/plain;
	charset="iso-8859-1"

I have got LVM 1.0.7 working with AS2.1 - it requires a couple of patches to
export some symbols that the AS kernel doesn't export by default. I can try
and dig them out tomorrow if there's interest.

Jon

-----Original Message-----
From: Fought,Tom
To: 'linux-lvm@sistina.com'
Sent: 10/09/2003 14:35
Subject: RE: [linux-lvm] Can't install LVM 1.0.7 on Redhat Advanced Server
2.1 Please help.

I have tried them all with AS 2.1, including patches.
I won't say definitively that LVM and AS 2.1 are impossible
to make work.. but I couldn't do it.

Taroon/AS3 comes with 1.0.3 installed. Redhat is currently not
going to move to a higher release of LVM from what I have found
on lists.

Tom

-----Original Message-----
From: Gene [mailto:starrygene@yahoo.com]
Sent: Wednesday, September 10, 2003 9:29 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Can't install LVM 1.0.7 on Redhat Advanced
Server 2.1 Please help.


Thanks Luca, have you tried installing LVM2 on a RH AS
2.1 server?

Regards,
Gene
--- Luca Berra <bluca@comedia.it> wrote:
> On Wed, Sep 10, 2003 at 04:48:40AM -0700, Gene
> wrote:
> >I run the ./configure --with-kernel_dir=/boot    
> >command, as I could not find a /usr/src/linux
> >directory.. (There are no directories under
> /usr/src)
> install the kernel-source rpm
> 
> >Does anyone know where the kernel_dir for RH AS is?
> I
> >would think it's in the /boot folder.
> /usr/src/linux, if you install the rpm.
> but you will soon discover that lvm 1.0.7 patches
> won't apply cleanly
> to the redhat patched kernel, and running a RHAS
> with a vanilla kernel
> is kinda silly.
> so, either you are prepared to fix the build by
> hand, or you wait for
> RHAS 3.0
> 
> regards,
> L.
> no, i don't have a RHAS handy anymore, so cannot
> give you a proper
> patch, besides i am not at all interested in lvm 1
> since lvm 2
> rocks.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPartTM-000-37ffafa9-9d25-4c44-9d25-6f9624042f46
Content-Type: text/plain;
	name="InterScan_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="InterScan_Disclaimer.txt"

************************************************************************
The information in this email is confidential and is intended solely
for the addressee(s).
Access to this email by anyone else is unauthorised. If you are not
an intended recipient, please notify the sender of this email 
immediately. You should not copy, use or disseminate the 
information contained in the email.
Any views expressed in this message are those of the individual
sender, except where the sender specifically states them to be
the views of Capco.

http://www.capco.com
***********************************************************************


------=_NextPartTM-000-37ffafa9-9d25-4c44-9d25-6f9624042f46--
