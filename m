From: Olof Aldin <olof@barbanet.com>
Subject: Re: [linux-lvm] Disc crash, want to recover some data... PLEASE HELP!
Message-ID: <20021230175908.GA17962@barbabok.barbanet.com>
References: <20021230024410.GA32395@barbabok.barbanet.com> <76580000.1041228785@[192.168.200.4]> <20021230101330.GA9881@barbabok.barbanet.com> <140950000.1041270041@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <140950000.1041270041@[192.168.200.4]>
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
Date: Mon Dec 30 11:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thank's but the problem was easier solved than that. I only put in an other
drive as /dev/hdb and the machine booted correctly. Then I could remove the
lv and pv followed by removing the temporary disc.

Thank's anyway for the help!

On Mon, Dec 30, 2002 at 11:40:41AM -0600, Steven Lembark wrote:
> 
> 
> -- Olof Aldin <so@barbanet.com>
> 
> >Whhich commands should I use?
> >
> >On Mon, Dec 30, 2002 at 12:13:05AM -0600, Steven Lembark wrote:
> >>
> >>> I saw something about
> >>>
> >>> vgchange -a y -q n /dev/vg
> >>
> >>Try exporting the inactive volume group and then building/
> >>importing a new vg with the live disks.
> 
> Start by checking out vgexport and vgimport.
> 
> 
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                            +1 800 762 1582
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
--------------------------------------
Olof Aldin <olof@barbanet.com>
http://barbabok.barbanet.com/olof/
+46 46 2118103, +46 703 451 412
