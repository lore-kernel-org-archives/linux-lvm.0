Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 1 Aug 2001 19:38:57 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] using LVM from two machines
Message-ID: <20010801193857.A12090@tykepenguin.com>
References: <20010801152451.41897.qmail@web14403.mail.yahoo.com> <20010801170828.G2603@tykepenguin.com> <20010801123800.A6008@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010801123800.A6008@sistina.com>; from lewis@sistina.com on Wed, Aug 01, 2001 at 12:38:00PM -0500
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

On Wed, Aug 01, 2001 at 12:38:00PM -0500, AJ Lewis wrote:
> On Wed, Aug 01, 2001 at 05:08:28PM +0100, Patrick Caulfield wrote:
> > The only way to achieve what you want to do at the moment is to unload the VGs
> > on one machine (vgchange -ay after closing all the volumes), make the changes
>                   ^^^^^^^^^^^^
> i believe patrick meant 'vgchange -an' here.


He did! Thanks AJ. 


patrick
