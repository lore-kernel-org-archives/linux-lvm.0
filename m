From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 and /proc support?
Message-ID: <20030913154242.A2155@uk.sistina.com>
References: <001001c378de$b4bd17f0$3300a8c0@home.dom> <1063374423.8147.0.camel@chtephan.cs.pocnet.net> <004e01c379ae$2c364390$3300a8c0@home.dom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004e01c379ae$2c364390$3300a8c0@home.dom>; from oh@storageone.co.kr on Sat, Sep 13, 2003 at 01:19:06PM +0900
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
Date: Sat Sep 13 09:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Sep 13, 2003 at 01:19:06PM +0900, Sean Oh wrote:
> How about device-mapper?
> Is there /proc support for any LVM related information?
 
Have you tried the new LVM2 reporting tools?

lvs, vgs, pvs
  --separator , --noheadings
  [-o|--options [+]Field[,Field]]
  [-O|--sort [+|-]key1[,[+|-]key2[,...]]]


Alasdair
-- 
agk@uk.sistina.com
