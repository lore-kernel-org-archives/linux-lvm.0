Date: Wed, 26 Jan 2000 20:54:53 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
Message-ID: <20000126205453.A4734@gruyere.muc.suse.de>
References: <15AD5D7936F8D21198240000F831776E3E8165@dboexc1.dbo.cpqcorp.net>
Mime-Version: 1.0
In-Reply-To: <15AD5D7936F8D21198240000F831776E3E8165@dboexc1.dbo.cpqcorp.net>; from Paul.Jakma@compaq.com on Wed, Jan 26, 2000 at 06:18:00PM -0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jakma, Paul" <Paul.Jakma@compaq.com>
Cc: 'Heinz Mauelshagen' <mauelsha@ez-darmstadt.telekom.de>, mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

On Wed, Jan 26, 2000 at 06:18:00PM -0000, Jakma, Paul wrote:
> > Yep.
> > That's why a change to use /proc/partitions is
> > in the current developement code.
> > 
> 
> eeekk... /proc.. no, no no. I've had too much crap with changes in format of
> /proc files breaking userland tools, i hate the same to happen to LVM. I
> think it would be much mroe hassle-free to just take the performance hit and
> scan /dev. 

Near all /proc reading programs that broke over time were due to very poorly
writen parsers. I'm sure Heinz is able to write a proper /proc parser :-)
(that checks the column titles first and uses them to find the right
column numbers, thus deals properly with added fields, not just the usual
fscanf hack) 

-Andi
