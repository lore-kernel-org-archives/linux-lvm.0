From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Does LVM2 support RAID?
Message-ID: <20030205185056.A18933@sistina.com>
References: <000701c2caba$18106290$0101a8c0@youriwyju5dfsf>
Mime-Version: 1.0
In-Reply-To: <000701c2caba$18106290$0101a8c0@youriwyju5dfsf>; from gozila@ms20.url.com.tw on Sun, Feb 02, 2003 at 08:53:32PM +0800
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
Date: Wed Feb  5 11:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Feb 02, 2003 at 08:53:32PM +0800, Rocky Lee wrote:
> 
> 
> 
>  Hi
> 
> 
>  Thank you Mr. Heinz   : - D
> 
>  I'm interesting in differents between  LVM1 and LVM2,

Some highlights IRT LVM2/device-mapper
(see www.sistina.com for download information):

- device-mapper has been accepted as the future generic mapping driver
  for the 2.5 kernel

- tools are LVM1 ondisk metadata compatible

- atomic updates on ondisk metadata and multiple metadata copies for
  extended resilience

- config file support for device name filters, logging levels and more

- LVM shell to avoid overhead on mass changes reloading the tools on
  every change

- generic device mapping with a much smaller driver (aka device-mapper)

- arbitrary mapping modules can be added at runtime

- RAID0 LVs can beextended beyond physical volume limits


>  I like LVM, it's very simple but powerful tool to maintain volumes.
> 
> 
> > > > If I use LVM2 will be better than use LVM1 + MD?
> >
> > > You still need to combine LVM2 with MD in order to have RAID > 0 (RAID0
> is
> > > supported natively as it is in LVM1).
> > > Because LVM2 offers various enhancements you migth still want to give it
> > > a try :-)
> >
> 
> Does LVM2 will support bad block reallocation?
>  It'll be great to use with MD.
> 
>  Have a nice day ^_^
> 
>  Rocky Lee
> 
> 
> 
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
