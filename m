Return-Path: <paulj@itg.ie>
Date: Mon, 8 Jan 2001 16:52:28 +0000 (GMT)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
In-Reply-To: <1504018708.20010108141026@lzer.net>
Message-ID: <Pine.LNX.4.30.0101081650120.23698-100000@rossi.itg.ie>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 8 Jan 2001, Jan Walzer wrote:

> Hello List,
>
>
>   Is there a way to "downpatch" the kernel to lvm0.8 ???

yes. open the patch in an editor and search for ^diff.*lvm, then edit
out that section, and search again...

when finished you have a patch that will leave LVM alone.

--paulj
