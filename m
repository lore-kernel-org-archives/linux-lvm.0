From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Does LVM2 support RAID?
Message-ID: <20030201133248.A2538@sistina.com>
References: <007201c2c815$08d488d0$c70aa8c0@RD.proware.com.tw>
Mime-Version: 1.0
In-Reply-To: <007201c2c815$08d488d0$c70aa8c0@RD.proware.com.tw>; from gozila@ms20.url.com.tw on Thu, Jan 30, 2003 at 12:06:57PM +0800
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
Date: Sat Feb  1 06:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 30, 2003 at 12:06:57PM +0800, Rocky Lee wrote:
> Hello all 
> 
> Happy Chinese New Year to you!
> and thanks for reading my issues.
> 
> Here's my question about LVM1 and LVM2
> 
> LVM1+ MD is good methd to support backup and data recovery of data.
> I found some documents said that LVM2 already can support disk protection and data recovery.
> does it mean that LVM2 including various raid algorithms ? or other features?

No RAID > 0 so far. In case we'll have capacity... ;)

> 
> How they work?
> 
> If I use LVM2 will be better than use LVM1 + MD?

You'll get tool advantages (i.e. config file support).

> 
> Thank you
> Have a nice day
>                             Rocky Lee

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
