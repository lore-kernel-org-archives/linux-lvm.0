Date: Fri, 16 Nov 2018 10:41:53 -0500
From: "Stuart D. Gathman" <stuart@gathman.org>
Message-Id: <1542382913.30686.3@mail.gathman.org>
In-Reply-To: <2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-I/3a2zuVk6i6/4ndcd/6"
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>

--=-I/3a2zuVk6i6/4ndcd/6
Content-Type: text/plain; charset=us-ascii; format=flowed

It's not very elegant, but the quick and dirty solution is to use sudo 
to allow certain users to run specific commands with a real uid of 
root.  You can say exactly what arguments the user has to use - the 
sudoers file is where this is configured.  Or you can make a script - 
which is probably better.  But said script should have no arguments, or 
as few as possible - because any complexity allows that user to attempt 
to exploit it to acheive root.  Such a script could trivially bring a 
specific LV online, writable by a specific user.  More complex 
requirement would be - more complex.

If LVM has more elegant features for this kind of thing, I'm all ears.

On Fri, Nov 16, 2018 at 8:43 AM, Christoph Pleger 
<christoph.pleger@cs.uni-dortmund.de> wrote:
>> Go back to the beginning and describe the original problem you are
>> trying to solve and the constraints you have and ask for advice about
>> ways to achieve it.
> 
> The beginning is that I want to create a user-specific logical volume 
> when a user logs in to a service that authenticates its users through 
> pam and that does not run as root.
> 
> Regards
>   Christoph
> 

--=-I/3a2zuVk6i6/4ndcd/6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>It's not very elegant, but the quick and dirty solution is to use sudo to allow certain users to run specific commands with a real uid of root. &nbsp;You can say exactly what arguments the user has to use - the sudoers file is where this is configured. &nbsp;Or you can make a script - which is probably better. &nbsp;But said script should have no arguments, or as few as possible - because any complexity allows that user to attempt to exploit it to acheive root. &nbsp;Such a script could trivially bring a specific LV online, writable by a specific user. &nbsp;More complex requirement would be - more complex.</div><div><br></div><div>If LVM has more elegant features for this kind of thing, I'm all ears.</div></div><div id="geary-quote" dir="auto"><br>On Fri, Nov 16, 2018 at 8:43 AM, Christoph Pleger &lt;christoph.pleger@cs.uni-dortmund.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;"><blockquote!
 >Go back to the beginning and describe the original problem you are
trying to solve and the constraints you have and ask for advice about
ways to achieve it.
</blockquote>
The beginning is that I want to create a user-specific logical volume when a user logs in to a service that authenticates its users through pam and that does not run as root.

Regards
  Christoph

</div></blockquote></div>
--=-I/3a2zuVk6i6/4ndcd/6--
