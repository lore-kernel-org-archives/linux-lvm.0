Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 17:50:06 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Any ideas..?
Message-ID: <20010424175006.I31988@sistina.com>
References: <Pine.A41.4.21.0104191234420.58874-100000@usm.my>
Mime-Version: 1.0
In-Reply-To: <Pine.A41.4.21.0104191234420.58874-100000@usm.my>; from irham@usm.my on Thu, Apr 19, 2001 at 12:43:16PM +0800
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

On Thu, Apr 19, 2001 at 12:43:16PM +0800, Ahmad Fadhlul Irham wrote:
> 
> I have go thru the Logical Volume Manager. The concept is clear and i have
> understand it's goal. My question, is there are feature to control the
> growing directory, not the filesystem. My scenario is, there are a
> directory on server-A (without unix user) that contain the user directory
> mail, propagate from pop3 email server. So i would like to control this
> growing directory. Do you have any suggestions..?..

The filesytem and therefore directories contained in it sits
on top of the block device layer (LVM is just one block device layer entity).

Your needs can only be addressed in the FS layer.
It is not clear to me though what your needs WRT control of the directory
actually are (data placemanent?) though.

> 
> <<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>
> 
> System Administrator		tel: 6577888
> Pusat Komputer 			ext: 3780/81
> Universiti Sains Malaysia	
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
