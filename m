From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and extending/reducing striped LV's
Message-ID: <20020529105302.B31380@sistina.com>
References: <Pine.LNX.4.21.0205291016260.6798-100000@kenny.worldonline.se>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0205291016260.6798-100000@kenny.worldonline.se>; from me@vger.org on Wed, May 29, 2002 at 10:21:09AM +0200
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
Date: Wed May 29 03:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 29, 2002 at 10:21:09AM +0200, me@vger.org wrote:
> After scaning thru the mailing list archive and reading some FAQs i can
> find information that <subject> are not available... atleast with older
> versions of lvm. My question is, can this be done now? Im using lvm
> 1.1-rc2 right now on 2.4.18. If anyone know how to do this with just lvm
> id be thankfull if you could drop me a mail with some pointers.

No, column extension beyond PV limits is not supported in LVM1.

You can have it with LVM2 ~June.

> 
> If this can not be done I have to go with the md RAID0/LVM layout to boost
> preformence from a linar lvm only layout.
> 
> Thanks to anyone that replys =)
> ps. include me in the reply because im not on the list.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
