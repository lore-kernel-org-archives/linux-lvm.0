Return-Path: <lembark@wrkhors.com>
Date: Sun, 12 Aug 2001 14:13:48 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <21550000.997643628@dizzy>
In-Reply-To: <20010812200701.A657@btconnect.com>
References: <20010811235718.A20414@linux.com>
 <20010812200701.A657@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com



> You should also be able to get all the information you need from the
> tools.

Problem with this is (a) having for fork/exec the tool at each
iteration and (b) having to capture/parse stdout/stderr and
check exit/signal status for each call.  Just the error checking
and validating stderr vs. stdout can double the code size for
getting data.

Another way out (which the /proc file system was intended to
avoid) is to put an add'l device file in the VG directory
(e.g., "./status") which delivers a struct or block text
with the same info as /proc has now.  Net result is that a
simple read or fgets will pull in the necessary info w/o
all the extra error checking.


--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
