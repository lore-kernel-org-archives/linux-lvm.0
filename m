Return-Path: <thornber@btconnect.com>
Date: Thu, 3 May 2001 23:15:23 +0100
Subject: Re: [linux-lvm] Patching 2.2.18 with lvm + sw raid
Message-ID: <20010503231523.B2057@66bassett.freeserve.co.uk>
References: <200105031535.QAA04020@queeg.britain.agilent.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200105031535.QAA04020@queeg.britain.agilent.com>; from dick@britain.agilent.com on Thu, May 03, 2001 at 04:35:06PM +0100
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

Please follow the instructions re. software raid in LVM/PATCHES/README.

If you wish to use 'new raid' you will have to edit the fragments
file.  The patch will only apply to a specific version of new raid
(the latest last time I looked).

If you're still having trouble mail me direct and I'll talk you through it.

- Joe

On Thu, May 03, 2001 at 04:35:06PM +0100, Dick Middleton wrote:
> Hi,
> 
>         I'm a bit new to all this and I'm struggling to patch my 2.2.18
> kernel with both software raid and lvm.  I can patch the kernel OK with
> either of them separately but I can't patch lvm over sw raid or raid over
> lvm.
> 
> Somebody else must have had this problem - how do I workaround it?
> 
> Dick
