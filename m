From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 on top of drbd
Message-ID: <20031113133348.O16901@uk.sistina.com>
References: <1068721582.11988.1.camel@manaslu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1068721582.11988.1.camel@manaslu>; from stefan@x-cellent.com on Thu, Nov 13, 2003 at 12:06:22PM +0100
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
Date: Thu Nov 13 07:35:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 13, 2003 at 12:06:22PM +0100, Stefan Majer wrote:
> fs2:~ # vgchange -ay
>   No volume groups found
> lvm2-2.00.07

What /dev entries should LVM2 on fs2 be using?
Do the filters in your LVM2 config file give access to them?

e.g. Do you need to add 
  types = [ "drbd", 16 ]
to the devices section?

Alasdair
-- 
agk@uk.sistina.com
