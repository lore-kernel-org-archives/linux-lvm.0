From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20021004104009.A8575@sistina.com>
References: <20021003094825.72334.qmail@web12303.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20021003094825.72334.qmail@web12303.mail.yahoo.com>; from ruchika_singh_2000@yahoo.com on Thu, Oct 03, 2002 at 02:48:25AM -0700
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
Date: Mon Oct  7 07:27:45 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 03, 2002 at 02:48:25AM -0700, Ruchika Adukia wrote:
> linux-lvm@sistina.com <linux-lvm@sistina.com>
> 
> hello,
> according to my knowledge snapshot's each pe holds
> first COW table structures and then data.

Correct.

> what i want
> to now is how to know that this chunk of data on pe
> belongs to which data block on the original filesystem
> and wether the file to which the data block belongs
> was created after the snapshot was taken.

If your question aims to answer the creation/modification issue:

- if the file doesn't exist in the original it was created *after* the
  snapshot was taken :)

- if it exists in both, you can compare the content

Please tell me, if you still need more information about the snapshot mappings.

> 
> Is there any other metadata stored on snapshot PE
> other than cow table entries.

No.

> 
> thanx ruchika
> 
> ruchika_singh_2000@yahoo.com
> 
> 
> __________________________________________________
> Do you Yahoo!?
> New DSL Internet Access from SBC & Yahoo!
> http://sbc.yahoo.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
