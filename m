Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 5 Feb 2001 12:59:08 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lv extend
Message-ID: <20010205125908.C525@tykepenguin.com>
References: <01C08F47.ADAB2B60.smdenton@bellsouth.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01C08F47.ADAB2B60.smdenton@bellsouth.net>; from smdenton@bellsouth.net on Mon, Feb 05, 2001 at 07:45:55AM -0500
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

On Mon, Feb 05, 2001 at 07:45:55AM -0500, S. Michael Denton wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Yes, printing the informative message may be a good idea as long as
> it doesn't interfere with function (ie no 'hit enter to continue' or
> anything like that). :)
> 

Wouldn't it be better to use e2fsadm? That will ajust the filesystem and the LV
in the correct order depending on whether you are extending or reducing the LV.

The message is only a resonable idea for extending - if you are reducing the
message would e something like "I hope you remembered to reduce your
filesystem/tablespace first!"

patrick
