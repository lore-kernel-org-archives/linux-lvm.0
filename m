Message-ID: <4848D933.8060201@redhat.com>
Date: Fri, 06 Jun 2008 08:29:07 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Help! snapshot apparenly trashed LVM [recovered?
	but still Q's]
References: <62138.128.218.6.3.1212706444.squirrel@biostat.ucsf.edu>
	<62860.128.218.6.3.1212708196.squirrel@biostat.ucsf.edu>
In-Reply-To: <62860.128.218.6.3.1212708196.squirrel@biostat.ucsf.edu>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tabor@biostat.ucsf.edu

ross@biostat.ucsf.edu wrote:
>> I did some expanding and shrinking of my volumes and then attempted to
>> take a snapshot.  I got an error message that started "Invalid LV in
>> extent map".  I now see that message when I do lvscan or pvscan as well.
>>
>> This looks very bad, and seems to be the same situation as described here:
>> http://weblog.pell.portland.or.us/~orc/2008/02/20/000/index.html

And where did you send bugreport for that problem?

ok, it seems that we have already one

https://bugzilla.redhat.com/show_bug.cgi?id=209927 

Should be fixed in LVM2 2.02.36.

Milan
--
mbroz@redhat.com
