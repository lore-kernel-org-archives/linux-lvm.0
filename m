Message-ID: <3E5DFE41.6020309@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport problem
References: <3E5CFF63.5040009@conterra.de> <20030227021208.A5222@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Feb 27 06:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> We fixed a vgimport bug with out-of-sequence PV numbers in LVM 1.0.6.
> 
> If pvdata shows you, that your PVs are not sequentially numbered (i.e.  1,3,4),
 > you probably want to try 1.0.6.

works! thank you.

Dieter.
