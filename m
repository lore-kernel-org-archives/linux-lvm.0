Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 6 Aug 2001 11:44:49 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Wrong use count?
Message-ID: <20010806114449.A5958@tykepenguin.com>
References: <20010726042140.B546@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010726042140.B546@lug-owl.de>; from jbglaw@lug-owl.de on Thu, Jul 26, 2001 at 04:21:40AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jul 26, 2001 at 04:21:40AM +0200, Jan-Benedict Glaw wrote:
> Hi!
> 
> Is lvm-mod's use count correct? Two seems one too much. And the IDE
> module'S use count seems to be wrong, too. They should be higher.
> I could try to rmmod(8) ide-*, but I fear to loose the volume:-)
> 
> Could you please enlighten me WRT LVM's and IDE's use count?

Don't know about IDE but the LVM use count is right - one for the VG and one for
the LV. 


patrick
