Return-Path: <thornber@btconnect.com>
Date: Mon, 30 Jul 2001 10:57:26 +0100
Subject: Re: [linux-lvm] rw-snapshot as an addition for lvm
Message-ID: <20010730105726.E562@btconnect.com>
References: <20010728182741.S13121@schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010728182741.S13121@schlund.de>; from anders@schlund.de on Sat, Jul 28, 2001 at 06:27:41PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Sat, Jul 28, 2001 at 06:27:41PM +0200, Anders Henke wrote:
> I think it's also quite interesting to have a rw-snapshot in which changes
> of both real and snapshot are being written to a smaller bufferspace on disk:
> the snapshot always represents the state of the LV when taking the snapshot,
> but permits changes on 'its copy'.

See other thread in the last few days on rw snapshots;  Yes, it's an
execellent idea.

- Joe
