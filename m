Return-Path: <prj@multivac.cwru.edu>
Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
References: <3B1BD4B8.A2C1E9A2@korn.ch>
	<Pine.SOL.3.96.1010606170637.27045C-100000@design.lbl.gov>
	<20010607182720.I3232@jensbenecke.de>
From: Paul Jarc <prj@po.cwru.edu>
Date: 07 Jun 2001 12:37:34 -0400
In-Reply-To: <20010607182720.I3232@jensbenecke.de> (Jens Benecke's message of "Thu, 7 Jun 2001 18:27:20 +0200")
Message-ID: <m3ofs0uty3.fsf@multivac.cwru.edu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jens Benecke <lvm@jensbenecke.de> writes:
> On Wed, Jun 06, 2001 at 05:08:47PM -0700, Damon Fasching wrote:
>> Is it possible using LVM define a logical volume which includes
>> disks from more than 1 machine?
> 
> I don't think so. You want NFS for that, or the Mosix GFS (global
> file system). Look at www.mosix.org

Couldn't PVs be network block devices?


paul
