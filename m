Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4J2BpG7025200
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 22:11:51 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4J2BmI9005789
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 22:11:49 -0400
Received: from [127.0.0.1] ([68.238.134.230])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0JI900MFQNFEOIV5@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 18 May 2007 21:11:43 -0500 (CDT)
Date: Fri, 18 May 2007 19:12:57 -0700
From: Greg Hanson <greg@perusion.com>
Subject: Re: [linux-lvm] difference in space used
In-reply-to: <20070519010033.GA12791@kallisti.us>
Message-id: <464E5D29.2020508@perusion.com>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary=------------050102000003020801070207
References: <464E22F3.5040108@perusion.com>
	<20070519010033.GA12791@kallisti.us>
Reply-To: Greg <greg@valuemedia.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Ross Vandegrift <ross@kallisti.us>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------050102000003020801070207
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ross Vandegrift wrote:
> On Fri, May 18, 2007 at 03:04:35PM -0700, Greg Hanson wrote:
>   
>> [root@newbox1 ~]# du /log/
>> 16      /log/lost+found
>> 23696   /log/httpd
>> 23716   /log/
>>
>> Any ideas as to what could be going on?
>>     
>
> An unlinked file isn't actually deleted until all file handles to it
> are closed.  Since this is your log partition, you probably have
> broken log rotation script.  I bet its moving the files to a new name,
> but the logging process isn't closing and reopening the logfile.
>
> These files that are unlinked but still have open handles to them
> continue to consume their usual amount of disk space.  FWIW, I have
> seen this issue particularly noticably with MySQL when the query log
> is enabled, but that's a wild guess...
>
>   
Thanks for the input Ross.  You are exactly on target.  I found another
post on another forum with regards to this,

http://lists.debian.org/debian-isp/2002/05/msg00046.html

and started examining the log rotate scripts. There was an error in the
path in the HUP line to restart apache, and there were many deleted log
files laying around.

this command

lsof | grep deleted

confirmed that there were several occurrences of error and access logs hanging in there.  
Did an apachectl stop and start and things went back to normal.

Thank you so much for the response!


Greg

-- 
Greg Hanson
Interchange Consulting
Perusion
1506 E Gilbert Ave
Coeur d'Alene, ID 83815

Email		greg@perusion.com
Phone		208-667-2442
Toll Free	800-949-1889
Fax		775-256-2231
Web		http://www.perusion.com



--------------050102000003020801070207
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Ross Vandegrift wrote:
<blockquote cite="mid:20070519010033.GA12791@kallisti.us" type="cite">
  <pre wrap="">On Fri, May 18, 2007 at 03:04:35PM -0700, Greg Hanson wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">[root@newbox1 ~]# du /log/
16      /log/lost+found
23696   /log/httpd
23716   /log/

Any ideas as to what could be going on?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
An unlinked file isn't actually deleted until all file handles to it
are closed.  Since this is your log partition, you probably have
broken log rotation script.  I bet its moving the files to a new name,
but the logging process isn't closing and reopening the logfile.

These files that are unlinked but still have open handles to them
continue to consume their usual amount of disk space.  FWIW, I have
seen this issue particularly noticably with MySQL when the query log
is enabled, but that's a wild guess...

  </pre>
</blockquote>
Thanks for the input Ross.&nbsp; You are exactly on target.&nbsp; I found another
post on another forum with regards to this, <br>
<br>
<a class="moz-txt-link-freetext" href="http://lists.debian.org/debian-isp/2002/05/msg00046.html">http://lists.debian.org/debian-isp/2002/05/msg00046.html</a><br>
<br>
and started examining the log rotate scripts. There was an error in the
path in the HUP line to restart apache, and there were many deleted log
files laying around.<br>
<br>
this command<br>
<pre>lsof | grep deleted

confirmed that there were several occurrences of error and access logs hanging in there.  
Did an apachectl stop and start and things went back to normal.

Thank you so much for the response!
</pre>
<br>
Greg<br>
<br>
<pre class="moz-signature" cols="72">-- 
Greg Hanson
Interchange Consulting
Perusion
1506 E Gilbert Ave
Coeur d'Alene, ID 83815

Email		<a class="moz-txt-link-abbreviated" href="mailto:greg@perusion.com">greg@perusion.com</a>
Phone		208-667-2442
Toll Free	800-949-1889
Fax		775-256-2231
Web		<a class="moz-txt-link-freetext" href="http://www.perusion.com">http://www.perusion.com</a>

</pre>
</body>
</html>

--------------050102000003020801070207--
