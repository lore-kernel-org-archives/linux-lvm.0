From: lembark@wrkhors.com
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <27800000.1011646909@duke.wrkhors.com>
In-Reply-To: <E16SlWH-0001gB-00@arwen.dev33.cvf>
References: <20020121201314.40293.qmail@web20303.mail.yahoo.com>
    <E16SlWH-0001gB-00@arwen.dev33.cvf>
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
Date: Mon Jan 21 15:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


> I have chosen ext3 file system instead of reiserfs because in case of current 
> failure some data may have problems if there are data accesses on. That's
> what  I was said.

I'd suggest checking carefully before attempting to extend
a mounted ext3 filesystem. Even if the doc's claim it's 
supported you can get into nasty logic races caused by not
wanting to buffer either the journal or cyl groups as they
are written. Theoretically it's all meta-data, but in reality
it takes time to write and failures during that process
can leave buffered cyl group information in core if the 
system croaks.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
