From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Help: LVM on top of SW RAID0+1
Message-ID: <20030315223816.GB16976@gw.silicide.dk>
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net> <3E70411C.AC385DAD@silicide.dk> <140150000.1047758272@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <140150000.1047758272@[192.168.200.4]>
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
Date: Sat Mar 15 16:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Mar 15, 2003 at 01:57:52PM -0600, Steven Lembark wrote:
> 
> 
> -- Jon Bendtsen <jon+lvm@silicide.dk>

[cut]

> >hmm. I tried various combinations of raid0 and raid1 ontop
> >of each other. One combination had a REALLY REALLY severe
> >performance penalty.
> 
> Why would you want to use raid0 with LVM? You can combine
> the mirrors into a VG and distribute the space out using
> LVM in the first place. You also have the option of using
> striping for performance if works out with the software mirrors.

You cant resize striped LV's. (AFAIR).




JonB
